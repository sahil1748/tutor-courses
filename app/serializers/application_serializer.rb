class ApplicationSerializer < ActiveModel::Serializer
  def rel_loaded?(relation)
    object.association(relation).loaded?
  end
end