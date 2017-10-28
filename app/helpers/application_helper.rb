module ApplicationHelper
  def sortable_header(title, column_name = title)
    sorted_by_this = params[:sort]&.include?(column_name)
    new_sort = if params[:sort] == "#{column_name} desc"
                 "#{column_name} asc"
               else
                 "#{column_name} desc"
               end

    sort_direction = if params[:sort]&.include?('asc')
                       '&uarr;'
                     else
                       '&darr;'
                     end

    link_to "#{title}&nbsp;#{sorted_by_this ? sort_direction : nil }".html_safe, params.permit!.merge(sort: new_sort)
  end
end
