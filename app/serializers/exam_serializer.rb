class ExamSerializer < ActiveModel::Serializer
  attributes :name, :skill_name, :description, :categories, :id
end
