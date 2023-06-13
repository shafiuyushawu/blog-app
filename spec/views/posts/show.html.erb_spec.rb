require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  it 'Render show template' do
    render template: 'posts/show'
    expect(rendered).to match('Posts of specific user')
  end
end
