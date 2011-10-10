#~ class Admin::CaptchaSettingsController < Admin::BaseController
  #~ def update
    #~ Spree::Captcha::Config.set(params[:preferences])

    #~ respond_to do |format|
      #~ format.html {
        #~ redirect_to admin_captcha_settings_path
      #~ }
    #~ end
  #~ end
#~ end

#new

class Admin::CaptchaSettingsController < Admin::BaseController
  def update

		config=Configuration.find_by_name("Captcha configuration")
    domain=get_sub_domain(current_subdomain)
    preference_checking=Preference.where("domain_url=? AND owner_type=? AND owner_id=?",domain,"Configuration",config.id)	
  	if preference_checking.blank?
    preference=Preference.create(:name=>"public_key",:owner_id=>config.id,:owner_type=>"Configuration",:value=>params[:preferences][:public_key],:domain_url=>domain)
    preference=Preference.create(:name=>"theme",:owner_id=>config.id,:owner_type=>"Configuration",:value=>params[:preferences][:theme],:domain_url=>domain)
		preference=Preference.create(:name=>"private_key",:owner_id=>config.id,:owner_type=>"Configuration",:value=>params[:preferences][:private_key],:domain_url=>domain)
   else
    preference_checking.each do |preference|
      preference.value= params[:preferences][:public_key] if preference.name=="public_key"
      preference.value= params[:preferences][:theme] if preference.name=="theme"
		  preference.value= params[:preferences][:private_key] if preference.name=="private_key"
      preference.save
    end
    end
    respond_to do |format|
      format.html {
        redirect_to admin_captcha_settings_path
      }
    end
  end
end

