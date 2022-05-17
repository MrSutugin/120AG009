Trestle.admin(:dashboard) do
  menu do
    item :dashboard, icon: 'fa fa-tachometer'
  end
  controller do
    def index
      @user_count = User.count()
    end
  end
end