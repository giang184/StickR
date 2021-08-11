require 'rails_helper'

describe "add a user" do

  it "adds a new user" do
    visit '/signup'
    fill_in 'user[email]', :with => 'jz@jz.com'
    fill_in 'user[password]', :with => 'jz'
    fill_in 'Password confirmation', :with => 'jz'
    click_on 'Sign Up'
    expect(page).to have_content 'successfully signed up!'
  end

  it "will not add a new user without password confirmation" do
    visit '/signup'
    fill_in 'user[email]', :with => 'jazz@jazz.com'
    fill_in 'user[password]', :with => 'jazz'
    click_on 'Sign Up'
    expect(page).to have_content 'There was a problem signing up'
  end
end