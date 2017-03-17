module ApplicationHelper
  def edit_and_destroy_buttons(item)
    unless current_user.nil?
      if current_user.admin? == true
        edit = link_to('Edit', url_for([:edit, item]), class:"btn btn-primary")
        del = link_to('Destroy', item, method: :delete,
                      data: {confirm: 'Are you sure?' }, class:"btn btn-danger")
      end
      raw("#{edit} #{del}")
    end
  end
end
