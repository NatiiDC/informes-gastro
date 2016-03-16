class Inspection < ActiveRecord::Base
  belongs_to :patient
  has_many :images

  validates :study_of_name,
    presence: true,
    inclusion: { in: %w(VideoEndoscopiaDigestivaAlta VideoEndoscopiaDigestivaAlta), message: "El estudio %{value} no es valido" }

  validates :study_of_type,
    presence: true

  validates :date,
    presence: true

  validates :reason,
    presence: true

  validates :conclusion,
    presence: true

end
