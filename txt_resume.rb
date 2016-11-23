class TxtResume
  WIDTH = 80

  def initialize(person)
    @person = person
    @line_number = 0
  end

  def print
    print_boundry
    print_header
    print_jobs
    print_other_blurbs
    print_boundry
  end

  private

  def print_header
    print_line("#{@person.name} (#{@person.email})")
    print_line("#{@person.website} || #{@person.github}")
    print_empty_line
    print_line("#{@person.blurb}")
    print_empty_line
  end

  def print_jobs
    @person.jobs.each do |job|
      print_line("#{job.name} (#{job.years})")
      print_line("#{job.blurb}")
      print_empty_line
    end
  end

  def print_other_blurbs
    @person.other_blurbs.each do |blurb|
      print_line(blurb)
    end
  end

  def print_empty_line
    print_line('')
  end

  def line_number
    @line_number.to_s.rjust(2, '0')
  end

  def print_line(content)
    wrap(content).each do |line|
      @line_number += 1
      printf("#{line_number},|  %-#{WIDTH}s |\n", line)
    end
  end

  def print_boundry
    @line_number += 1
    puts "#{line_number},+" + Array.new(WIDTH + 3, '-').join + '+'
  end

  def wrap(content)
    if content.length >= WIDTH
      content.gsub(/(.{1,#{WIDTH}})(\s+|\Z)/, "\\1\n").split("\n")
    else
      [content]
    end
  end

end

class Record
  def initialize(details)
    details.each { |k, v| instance_variable_set "@#{k}", v }
  end
end


class Person < Record
  attr_accessor :name, :email, :website, :github, :blurb, :jobs, :languages, :other_blurbs

  def initialize(details)
    super
  end
end

class Job < Record
  attr_accessor :name, :years, :blurb

  def initialize(details)
    super
  end
end
