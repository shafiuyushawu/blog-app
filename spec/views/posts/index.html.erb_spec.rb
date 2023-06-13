require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  it 'Render index template' do
    render template: 'posts/index'
    expect(rendered).to match('<h1>List of post by a user</h1>')
  end
end
