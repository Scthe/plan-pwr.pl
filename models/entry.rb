# encoding: utf-8

class Entry

  attr_accessor :course_code, :course_name, :course_type, :group_code, :week, :week_day, :building, :room, :lecturer, :start_hour, :start_min, :end_hour, :end_min

  def location
    blank = lambda { |day| day.nil? || day.empty?}
    [building, room].reject{|e| blank.call(e)}.join(" / ")
    #[building, room].reject{|e| e.blank?}.join(" / ")
  end

  def week_name
    Epure::Config::WEEKS_NAMES[week]
  end

  def course_name_with_type
    "#{course_name} (#{course_type})"
  end

  def description
    [lecturer, course_code].reject{|e| e.blank?}.join("\n")
  end

  def in_week?(n)
    week == 0 || (n - week) % 2 == 0
  end

=begin
  protected

  def self.search(term, key)
    query = term.to_s.strip
    if query.blank?
      []
    else
      select("DISTINCT(#{key})").where("trim(both #{key}) ILIKE ?", "%#{query}%").limit(20).map(&key)
    end
  end

  def correct_time
    if !start_hour || !start_min || !end_hour || !end_min || start_hour > end_hour || (start_hour == end_hour && start_min >= end_min)
      errors.add(:start_hour, "Podane godziny są niepoprawne")
    end
  end

  def invalidate_cache
    schedule.invalidate_cache
  end
=end

end
