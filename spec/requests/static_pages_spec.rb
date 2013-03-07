require 'spec_helper'

describe "Static pages" do 
	let (:base_title){"Ruby on Rails Tutorial Sample App"}
	subject { page }
	describe "Home page" do
		before { visit root_path }
		it { should have_content('Sample App') }
		it { should have_selector('title',:text=>"#{base_title}") }
		it { should_not have_selector('title',:text=>full_title('| Home')) }
	end
	describe "Help page" do
		before {visit help_path}
		it { should have_content('Help') }
		it { should have_selector('title',:text => full_title('Help') )}
	end
	describe "About page" do
		before {visit about_path}
		it { should have_content('About Us') }
	  it { should have_selector('title',:text => full_title('About')) }
	end
	describe "Contact page" do
		before {visit contact_path}
		it { should have_content('Contact Us') }
	  it { should have_selector('title',:text => full_title('Contact'))}
	end
	it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', :text=> full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', :text=> full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', :text=> full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', :text=> full_title('Sign up')
    click_link "sample app"
    page.should # fill in
  end
end
