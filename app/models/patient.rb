class Patient < User
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.type ||= :patient
  end

end
