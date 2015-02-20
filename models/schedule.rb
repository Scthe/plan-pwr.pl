class Schedule

  attr_accessor :year, :semester, :entries, :color_scheme

  def initialize
    @entries = []
    @color_scheme = :default
  end

  def days
    @days ||= begin
      d = entries.group_by {|e| e.week_day }
      #x = d[6].blank? ? (d[5].blank? ? 4 : 5) : 6
      blank = lambda { |day| day.nil? || day.empty?}
      x = blank.call(d[6])  ? ( blank.call(d[5])  ? 4 : 5) : 6
      (0..x).each {|i| d[i] ||= []}
      d
    end
  end

=begin
  def semester_name
    Epure::Config::SEMESTERS_NAMES[semester]
  end

  def to_json(options = {})
    super(serialize_options)
  end

  def to_xml(options = {})
    super(serialize_options)
  end

  def serialize_options
    {
      :except => [:created_at, :updated_at, :id, :slug],
      :include => {
        :entries => {
          :except => [:created_at, :updated_at, :id, :schedule_id]
        }
      }
    }
  end

  def set_color_scheme(name)
    @color_schemes.destroy_all
    Epure::Config::COLOR_SCHEMES[name].each_pair do |type, colors|
      cs = @color_schemes.new(:background => colors[0], :border => colors[1], :font => colors[2])
      cs.course_type = type
      cs.save
    end

    @color_schemes.reload
    #invalidate_cache
  end

  def pwr?
    !(year.blank? || semester.blank?)
  end

  def generate_slug
    self.slug = rand(36**8).to_s(36) + id.to_s(36)
    save
  end

  def create_default_color_schemes
    set_color_scheme(:default)
  end

  def invalidate_cache
    Rails.cache.delete_matched("schedule:#{slug}*")
  end
=end

end
