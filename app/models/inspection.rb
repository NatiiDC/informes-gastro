class Inspection < ActiveRecord::Base
  belongs_to :patient

  validates :study_of_name,
    presence: true

  validates :study_of_type,
    presence: true

  validates :date,
    presence: true

  validates :reason,
    presence: true

  validates :report,
    presence: true

  validates :conclusion,
    presence: true

end
