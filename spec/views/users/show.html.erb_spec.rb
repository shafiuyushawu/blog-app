require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :view do
  it 'renders index template' do
    render template: 'users/index'
    expect(rendered).to match '<h1>List of users</h1>'
  end
end
