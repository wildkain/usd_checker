require_relative '../acceptance_helper.rb'

feature 'Change current currency', %q{
  In oreder to change current currency
  As user
  I wan to be able to change current currency
}do
  hour = (Time.zone.now + 2.hours).strftime("%I")

  scenario 'user change currency' do
    visit '/admin'
    fill_in 'Value', with: 125
    select "#{hour}", :from =>  "currency[to(4i)]"
    save_and_open_page
    click_on 'Save'

    expect(page).to have_content "Currency succesfuly saved!"
  end

  scenario 'user change currency' do
    visit '/admin'
    fill_in 'Value', with: 125
    select "#{hour}", :from =>  "currency[to(4i)]"
    save_and_open_page
    click_on 'Save'

    expect(page).to have_content "Currency succesfuly saved!"
  end

  #Test for ActionCable
  context 'multiple sessions ' do
    scenario 'question appears to another user page', js: true do
      Capybara.using_session('user') do
        visit '/admin'
      end

      Capybara.using_session('another_user') do
        visit '/'
        expect(page).to_not have_content '125'
      end

      Capybara.using_session('user') do
        fill_in 'Value', with: 125
        select "#{hour}", :from =>  "currency[to(4i)]"
        click_on 'Save'
        sleep 1

        Capybara.using_session('another_user') do
          expect(page).to have_content '125'
        end
      end
    end
  end
end