require "vagrant"

module VagrantPlugins
  module CapistranoPush
    class Plugin < Vagrant.plugin("2")
      name "capistrano"
      description <<-DESC
      Run capistrano to push
      DESC

      config(:capistrano, :push) do
        require File.expand_path("../config", __FILE__)
        init!
        Config
      end

      push(:capistrano) do
        require File.expand_path("../push", __FILE__)
        init!
        Push
      end

      protected

      def self.init!
        return if defined?(@_init)
        I18n.load_path << File.expand_path("locales/en.yml", CapistranoPush.source_root)
        I18n.reload!
        @_init = true
      end
    end
  end
end
