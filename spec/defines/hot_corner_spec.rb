require 'spec_helper'

describe 'osx::dock::hot_corner', :type => :define do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  {'Top Left' => 'tl', 'Top Right' => 'tr', 'Bottom Left' => 'bl', 'Bottom Right' => 'br'}.each_pair do |position, position_value|
    context "for #{position} corner" do

      {'Mission Control' => 2, 'Application Windows' => 3, 'Desktop' => 4,
       'Start Screen Saver' => 5, 'Disable Screen Saver' => 6, 'Dashboard' => 7,
       'Put Display to Sleep' => 10, 'Launchpad' => 11, 'Notification Center' => 12}.each_pair do |action, action_value|

        context "and action '#{action}'" do

          context "using type title" do
            let :title do
              position
            end

            let :params do
              { :action => action }
            end

            it do
              should contain_class('osx::dock')

              should contain_boxen__osx_defaults("Hot Corners #{position} Action").with({
                :key    => "wvous-#{position_value}-corner",
                :domain => 'com.apple.dock',
                :type   => 'int',
                :value  => action_value,
                :user   => facts[:boxen_user],
                :notify => 'Exec[killall Dock]'
              })

              should contain_boxen__osx_defaults("Hot Corners #{position} Modifier").with({
                :key    => "wvous-#{position_value}-modifier",
                :domain => 'com.apple.dock',
                :type   => 'int',
                :value  => 0,
                :user   => facts[:boxen_user],
                :notify => 'Exec[killall Dock]'
              })
            end 
          end

          context "using position parameter" do
            let :title do
              "Active Corner"
            end

            let :params do
              { :action => action, :position => position }
            end

            it do
              should contain_class('osx::dock')

              should contain_boxen__osx_defaults("Hot Corners #{position} Action").with({
                :key    => "wvous-#{position_value}-corner",
                :domain => 'com.apple.dock',
                :type   => 'int',
                :value  => action_value,
                :user   => facts[:boxen_user],
                :notify => 'Exec[killall Dock]'
              })

              should contain_boxen__osx_defaults("Hot Corners #{position} Modifier").with({
                :key    => "wvous-#{position_value}-modifier",
                :domain => 'com.apple.dock',
                :type   => 'int',
                :value  => 0,
                :user   => facts[:boxen_user],
                :notify => 'Exec[killall Dock]'
              })
            end 
          end

        end
      end
    end
  end
end
