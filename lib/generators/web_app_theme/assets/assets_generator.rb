module WebAppTheme
    class AssetsGenerator < Rails::Generators::Base
      desc "Copy the --theme stylesheets to your rails application assets path, so you can customize them"
      source_root File.expand_path('../../../../../app/assets/', __FILE__)
      class_option :theme,        :type => :string,   :default => :default,   :desc => 'Specify the layout theme to be copied'

      def copy_stylesheets
        ext = File.exist?(File.join(self.class.source_root, "stylesheets/web-app-theme/#{options.theme}.css")) ? '.css' : '.scss'
        copy_file "stylesheets/web-app-theme.css"          , "app/assets/stylesheets/web-app-theme.css"
        copy_file "stylesheets/web-app-theme/#{options.theme}#{ext}", "app/assets/stylesheets/web-app-theme/#{options.theme}#{ext}"
      end

      def copy_images
        if File.exist?(File.join(self.class.source_root, "images/web-app-theme/#{options.theme}"))
          directory "images/web-app-theme/#{options.theme}", "app/assets/images/web-app-theme/#{options.theme}"
        end
      end

    end
  end
