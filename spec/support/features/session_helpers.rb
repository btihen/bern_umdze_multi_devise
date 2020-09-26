module Features
  module SessionHelpers
    # def patron_sign_up(username:, password:)
    #   visit new_patron_registration_path
    #   expect(page).to have_button('Sign up')
    #   fill_in 'Username', with: username
    #   fill_in 'Password', with: password
    #   click_button 'Sign up'
    # end
    def patron_log_in(patron = nil)
      patron = FactoryBot.create :patron if patron.nil?
      visit new_patron_session_path
      expect(page).to have_button('Log in')
      fill_in 'Email', with: patron.email
      fill_in 'Password', with: patron.password
      click_on 'Log in'
      # expect(current_path).to eql(patron_home_path)
    end

    # def umdze_sign_up(email:, password:)
    #   visit new_umdze_registration_path
    #   expect(page).to have_button('Sign up')
    #   fill_in 'Email', with: email
    #   fill_in 'Password', with: password
    #   click_button 'Sign up'
    # end
    def umdze_log_in(umdze = nil)
      umdze = FactoryBot.create :umdze if umdze.nil?
      visit new_umdze_session_path
      expect(page).to have_button('Log in')
      fill_in 'Email', with: umdze.email
      fill_in 'Password', with: umdze.password
      click_on 'Log in'
    end

    # def admin_sign_up(email:, password:)
    #   visit new_admin_registration_path
    #   expect(page).to have_button('Sign up')
    #   fill_in 'Email', with: email
    #   fill_in 'Password', with: password
    #   click_button 'Sign up'
    # end
    def admin_log_in(admin = nil)
      admin = FactoryBot.create :admin if admin.nil?
      visit new_admin_session_path
      expect(page).to have_button('Log in')
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_on 'Log in'
    end
  end
end
