module ApplicationHelper
end

# <div class="flex flex-col items-center justify-center">
#   <h2 class="text-4xl">Sign up</h2>
#   <%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>
#     <%= render "devise/shared/error_messages", resource: resource %>
#     <div class="field">
#       <%= f.label :name %><br />
#       <%= f.text_field :name %>
#     </div>

#     <div class="field">
#       <%= f.label :email %><br />
#       <%= f.email_field :email, autofocus: true, autocomplete: "email" %>
#     </div>

#     <div class="field">
#       <%= f.label :password %>
#       <% if @minimum_password_length %>
#       <em>(<%= @minimum_password_length %> characters minimum)</em>
#       <% end %><br />
#       <%= f.password_field :password, autocomplete: "new-password" %>
#     </div>

#     <div class="field">
#       <%= f.label :password_confirmation %><br />
#       <%= f.password_field :password_confirmation, autocomplete: "new-password" %>
#     </div>

#     <div class="actions">
#       <br />
#       <%= f.submit "Sign up", class: "btn btn-sm btn-success w-full" %>
#     </div>
#   <% end %>
#   <br />
#   <%= render "devise/shared/links" %>
# </div>
