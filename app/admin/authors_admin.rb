Trestle.resource(:authors) do
  collection do
    Author.order(created_at: :desc).includes(:book)
  end

  search do |q|
    q ? collection.where("name LIKE ?", "%#{q}%") : collection
  end

  menu do
    item :authors, icon: "fa fa-star"
  end

  table do
    column :name, link: true
    column :book, ->(author) { author.book.name }, link: true
    column :created_at, align: :center
    column :updated_at, header: "Last Updated", align: :center
    column :status, align: :center do |obj|
      status_tag(icon("fa fa-check"), :success) if !obj.status?
    end

    actions
  end

  form do
    # Organize fields into tabs and sidebars
    tab :author do
      text_field :name

      # Define custom form fields for easy re-use
      # editor :body
    end

    tab :metadata do
      # Layout fields based on a 12-column grid
      row do
        col(sm: 6) { select :book_id, Book.all }
        # col(sm: 6) { tag_select :tags }
      end
    end

    sidebar do
      # Render a custom partial: app/views/admin/posts/_sidebar.html.erb
      # display at the pulled right section
      render "sidebar"
    end
  end

  params do |params|
    # you can filter required parameters
    params.require(:author).permit(:name, :book_id, :created_at, :updated_at)
  end
end
