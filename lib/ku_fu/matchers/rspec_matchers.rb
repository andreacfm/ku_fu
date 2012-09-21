RSpec::Matchers.define :register_ku_fu do |attribute|
  match do |model|
    m = model.respond_to?(:new) ? model.new : model
    m.respond_to?(:ku_fu_register)
  end
end
