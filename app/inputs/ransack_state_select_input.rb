class RansackStateSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def collection
    model = object.klass
    model.state_machine.states.map { |s| [s.human_name, s.name] }
  end
end