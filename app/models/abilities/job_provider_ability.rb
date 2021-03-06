# frozen_string_literal: true

# All authorization module for user with core role
module JobProviderAbility
  def job_provider(user)
    can :create_job, User
    can :view_job, User
    can :modify_applicants, User
  end
end
