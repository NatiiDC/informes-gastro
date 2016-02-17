class Patient < ActiveRecord::Base

  as_enum :type_document, %i{dni, ci, lc}, prefix: true

  has_many :inspections

  validates :firstname,
    presence: true,
    length: { in: 2..30 }
  validates :lastname,
    presence: true,
    length: { in: 2..30 }
  validates :type_document_cd,
    presence: true,
    inclusion: { in: %w(DNI CI LD), message: "clave: %{value} no es valido" }
  validates :document_number, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 800000,
    less_than_or_equal_to: 99999999},
    uniqueness: {scope: :type_document_cd},
    presence: true



end
