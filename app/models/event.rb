class Event < ActiveRecord::Base
  has_paper_trail
  before_save :calc_duration

  attr_accessible :title, :description, :category, :course_id, :is_template,
                  :duration, :start_time, :end_time, :instructor, :location,
                  :id_code, :status, :timecard_ids, :person_ids, :comments,
                  :department_ids

  validates_presence_of :category, :title, :status

  validates_presence_of :start_time
  # Currently we need an end time to provide proper ranges to the scopes.
  # This will need to be revisited
  validates_presence_of :end_time  #, :if => :completed?
  validates_chronology :start_time, :end_time

  has_and_belongs_to_many :departments
  has_many :certs
  belongs_to :course
  has_many :activities, as: :loggable

  has_many :timecards
  has_many :people, :through => :timecards
  has_many :tasks
  has_many :notifications

  accepts_nested_attributes_for :timecards
  accepts_nested_attributes_for :certs

  scope :upcoming, -> { order("start_time ASC").where( "status in (?) AND end_time > ?", ["Scheduled", "In-session"], Time.now ) }

  CATEGORY_CHOICES = ['Training', 'Patrol', 'Meeting', 'Admin', 'Event', 'Template']
  STATUS_CHOICES = ['Scheduled', 'In-session', 'Completed', 'Cancelled', "Closed"]

  def to_s
    description
  end

  def unavailabilities
    responses.unavailable + partial_responses.unavailable
  end

  def unavailable_people
    unavailabilities.map{|a| a.person}
  end

  def partial_responses
    Availability.partially_available(self.start_time..self.end_time)
  end

  def partial_availabilities
    partial_responses.available
  end

  def partially_available_people
    partial_availabilities.includes(:person).map{|a| a.person}.uniq
  end

  def partial_responding_people
    self.partial_responses.map { |a| a.person }
  end

  def availabilities
    responses.available
  end

  def available_people
    responses.includes(:person).available.map{|a|a.person}.uniq
  end

  def responses
    Availability.for_time_span(self.start_time..self.end_time)
  end

  def responding_people
    self.responses.map { |a| a.person }
  end

  def eligible_people
    Person.active.where(department: self.departments)
  end

  def unresponsive_people
    eligible_people - responding_people - partial_responding_people
  end

  def manhours
    self.timecards.sum('actual_duration')
  end

  def self.find_by_code(id_code)
    return ::Error::Base.new({code: 211, description: "No id_code given"}) if id_code.blank?
    event = Event.where(id_code: id_code).first
    return ::Error::Base.new({code: 201, description: "Event #{id_code} not found"}) if event.blank?
    return event
  end

  def scheduled_people
    scheduled_timecards.map{|t|t.person}.uniq
  end
  def scheduled_timecards
    # TODO In the pr that add Assignments, this will need to changes
    # Something like assignments.people.unique
    self.timecards.scheduled
  end

  def completed?
    status == "Completed"
  end

  def schedule(schedulable, schedule_action, timecard = Timecard.new )
    # TODO This is probably now deprecated. PR for assignments should remove this
    @card = timecard
    @card.person = schedulable if schedulable.class.name == "Person"
    @card.event = self
    case schedule_action
      when "Available", "Scheduled", "Unavailable"
        @card.intention = schedule_action
        @card.intended_start_time = self.start_time
        @card.intended_end_time = self.end_time
      when "Worked"
        @card.outcome = schedule_action
        @card.actual_start_time = self.start_time
        @card.actual_end_time = self.end_time
    end
    @card.save
    return @card
  end

  def ready_to_schedule?(schedule_action)
    return false if self.nil?
    return false if schedule_action.blank?
    return false if self.status.blank?
    return false if self.status == "Closed"

    case schedule_action
      when "Available", "Scheduled", "Unavailable"
        return false if self.start_time.blank?
      when "Worked"
        return false if self.start_time.blank? or self.end_time.blank?
    end
    return true
  end

private
  def calc_duration #This is also used in timecards; it should be extracted out
     if !(start_time.blank?) and !(end_time.blank?)
      self.duration = ((end_time - start_time) / 1.hour).round(2) || 0
    end
  end
end
