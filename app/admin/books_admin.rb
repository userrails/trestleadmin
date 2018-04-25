Trestle.resource(:books) do
  menu do
    item :books, icon: "fa fa-circle"
  end

  # by default all rails column will display e.g: is, name, created, updated
  table do
    column :name
    column :created_at, align: :center
    column :updated_at

    actions
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |book|
  #   text_field :name
  #
  #   row do
  #     col(xs: 6) { datetime_field :updated_at }
  #     col(xs: 6) { datetime_field :created_at }
  #   end
  # end

  form do |book|
    text_field :name

    # you can hide this code as it is auto saved
    row do
      col(xs: 6) { datetime_field :updated_at }
      col(xs: 6) { datetime_field :created_at }
    end

    render "authors"
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:book).permit(:name, ...)
  # end

  params do |params|
    # you can filter required parameters
    params.require(:book).permit(:name, :created_at, :updated_at,
      authors_attributes: [:name, :id]
      )
  end
end
