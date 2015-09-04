ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :name, :surname, :adres, :tel

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :adres
    column :tel
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :name
  filter :surname
  filter :adres
  filter :tel

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :surname
      f.input :adres
      f.input :tel
    end
    f.actions
  end

end
