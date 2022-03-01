class Role < ActiveRecord::Base
  has_many :auditions

  def audition_list
    self.auditions.map { |audition| audition }
  end

  def actors
    self.auditions.map { |audition| audition.actor }
  end

  def locations
    self.auditions.map { |audition| audition.location }
  end

  def lead
    if self.auditions.find_by(hired: true)
      self.auditions.find_by(hired: true)
    else
      "no actor has been hired for this role"
    end
  end

  def understudy
    self.auditions.where(hired: true).second
  end
end
