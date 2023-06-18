module GroupsHelper
  def active_group?(group)
    group == current_user.active_group
  end
end
