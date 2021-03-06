ActiveAdmin.register Post do

	belongs_to :category, optional: true
	belongs_to :equipo, optional: true

	form(:html => { :multipart => true }) do |f|
		f.inputs 'Publicacion' do
			f.input :titulo
			f.input :category, member_label: :nombre
			f.input :equipo, member_label: :apellidos
			f.input :contenido, :as => :ckeditor
			f.input :imagen, :as => :file, :label => "Subir Imagen"
			f.input :estado
		end
		f.actions
	end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
 permit_params do
   permitted = [:titulo, :contenido,:imagen,:estado, :category_id, :equipo_id]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
 end


end
