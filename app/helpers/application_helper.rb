module ApplicationHelper

  def current_class?(test_path)
    return 'system-nav__link--active' if request.path == test_path
    ''
  end

end
