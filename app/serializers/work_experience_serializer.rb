# frozen_string_literal: true

class WorkExperienceSerializer < ActiveModel::Serializer
  attributes :job_title, :organization_name, :categories, :start_date,
             :end_date, :salary, :level, :description

  def categories
    object.categories&.map(&:name)
  end
end
