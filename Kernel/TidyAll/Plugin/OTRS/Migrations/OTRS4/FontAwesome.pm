# --
# Copyright (C) 2001-2019 OTRS AG, https://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package TidyAll::Plugin::OTRS::Migrations::OTRS4::FontAwesome;    ## no critic

use strict;
use warnings;

use parent qw(TidyAll::Plugin::OTRS::Base);

sub validate_source {                                             ## no critic
    my ( $Self, $Code ) = @_;

    return $Code if $Self->IsPluginDisabled( Code => $Code );
    return if $Self->IsFrameworkVersionLessThan( 4, 0 );

    my %Icons = (
        'icon-adjust'                 => 1,
        'icon-adn'                    => 1,
        'icon-align-center'           => 1,
        'icon-align-justify'          => 1,
        'icon-align-left'             => 1,
        'icon-align-right'            => 1,
        'icon-ambulance'              => 1,
        'icon-anchor'                 => 1,
        'icon-android'                => 1,
        'icon-angle-down'             => 1,
        'icon-angle-left'             => 1,
        'icon-angle-right'            => 1,
        'icon-angle-up'               => 1,
        'icon-apple'                  => 1,
        'icon-archive'                => 1,
        'icon-arrow-down'             => 1,
        'icon-arrow-left'             => 1,
        'icon-arrow-right'            => 1,
        'icon-arrow-up'               => 1,
        'icon-asterisk'               => 1,
        'icon-backward'               => 1,
        'icon-ban-circle'             => 1,
        'icon-bar-chart'              => 1,
        'icon-barcode'                => 1,
        'icon-beaker'                 => 1,
        'icon-beer'                   => 1,
        'icon-bell'                   => 1,
        'icon-bell-alt'               => 1,
        'icon-bitbucket'              => 1,
        'icon-bitbucket-sign'         => 1,
        'icon-bitcoin'                => 1,
        'icon-bold'                   => 1,
        'icon-bolt'                   => 1,
        'icon-book'                   => 1,
        'icon-bookmark'               => 1,
        'icon-bookmark-empty'         => 1,
        'icon-briefcase'              => 1,
        'icon-btc'                    => 1,
        'icon-bug'                    => 1,
        'icon-building'               => 1,
        'icon-bullhorn'               => 1,
        'icon-bullseye'               => 1,
        'icon-calendar'               => 1,
        'icon-calendar-empty'         => 1,
        'icon-camera'                 => 1,
        'icon-camera-retro'           => 1,
        'icon-caret-down'             => 1,
        'icon-caret-left'             => 1,
        'icon-caret-right'            => 1,
        'icon-caret-up'               => 1,
        'icon-certificate'            => 1,
        'icon-check'                  => 1,
        'icon-check-empty'            => 1,
        'icon-check-minus'            => 1,
        'icon-check-sign'             => 1,
        'icon-chevron-down'           => 1,
        'icon-chevron-left'           => 1,
        'icon-chevron-right'          => 1,
        'icon-chevron-sign-down'      => 1,
        'icon-chevron-sign-left'      => 1,
        'icon-chevron-sign-right'     => 1,
        'icon-chevron-sign-up'        => 1,
        'icon-chevron-up'             => 1,
        'icon-circle'                 => 1,
        'icon-circle-arrow-down'      => 1,
        'icon-circle-arrow-left'      => 1,
        'icon-circle-arrow-right'     => 1,
        'icon-circle-arrow-up'        => 1,
        'icon-circle-blank'           => 1,
        'icon-cloud'                  => 1,
        'icon-cloud-download'         => 1,
        'icon-cloud-upload'           => 1,
        'icon-cny'                    => 1,
        'icon-code'                   => 1,
        'icon-code-fork'              => 1,
        'icon-coffee'                 => 1,
        'icon-cog'                    => 1,
        'icon-cogs'                   => 1,
        'icon-collapse'               => 1,
        'icon-collapse-alt'           => 1,
        'icon-collapse-top'           => 1,
        'icon-columns'                => 1,
        'icon-comment'                => 1,
        'icon-comment-alt'            => 1,
        'icon-comments'               => 1,
        'icon-comments-alt'           => 1,
        'icon-compass'                => 1,
        'icon-copy'                   => 1,
        'icon-credit-card'            => 1,
        'icon-crop'                   => 1,
        'icon-css3'                   => 1,
        'icon-cut'                    => 1,
        'icon-dashboard'              => 1,
        'icon-desktop'                => 1,
        'icon-dollar'                 => 1,
        'icon-double-angle-down'      => 1,
        'icon-double-angle-left'      => 1,
        'icon-double-angle-right'     => 1,
        'icon-double-angle-up'        => 1,
        'icon-download'               => 1,
        'icon-download-alt'           => 1,
        'icon-dribbble'               => 1,
        'icon-dropbox'                => 1,
        'icon-edit'                   => 1,
        'icon-edit-sign'              => 1,
        'icon-eject'                  => 1,
        'icon-ellipsis-horizontal'    => 1,
        'icon-ellipsis-vertical'      => 1,
        'icon-envelope'               => 1,
        'icon-envelope-alt'           => 1,
        'icon-eraser'                 => 1,
        'icon-eur'                    => 1,
        'icon-euro'                   => 1,
        'icon-exchange'               => 1,
        'icon-exclamation'            => 1,
        'icon-exclamation-sign'       => 1,
        'icon-expand'                 => 1,
        'icon-expand-alt'             => 1,
        'icon-external-link'          => 1,
        'icon-external-link-sign'     => 1,
        'icon-eye-close'              => 1,
        'icon-eye-open'               => 1,
        'icon-facebook'               => 1,
        'icon-facebook-sign'          => 1,
        'icon-facetime-video'         => 1,
        'icon-fast-backward'          => 1,
        'icon-fast-forward'           => 1,
        'icon-female'                 => 1,
        'icon-fighter-jet'            => 1,
        'icon-file'                   => 1,
        'icon-file-alt'               => 1,
        'icon-file-text'              => 1,
        'icon-file-text-alt'          => 1,
        'icon-film'                   => 1,
        'icon-filter'                 => 1,
        'icon-fire'                   => 1,
        'icon-fire-extinguisher'      => 1,
        'icon-flag'                   => 1,
        'icon-flag-alt'               => 1,
        'icon-flag-checkered'         => 1,
        'icon-flickr'                 => 1,
        'icon-folder-close'           => 1,
        'icon-folder-close-alt'       => 1,
        'icon-folder-open'            => 1,
        'icon-folder-open-alt'        => 1,
        'icon-font'                   => 1,
        'icon-food'                   => 1,
        'icon-forward'                => 1,
        'icon-foursquare'             => 1,
        'icon-frown'                  => 1,
        'icon-fullscreen'             => 1,
        'icon-gamepad'                => 1,
        'icon-gbp'                    => 1,
        'icon-gear'                   => 1,
        'icon-gears'                  => 1,
        'icon-gift'                   => 1,
        'icon-github'                 => 1,
        'icon-github-alt'             => 1,
        'icon-github-sign'            => 1,
        'icon-gittip'                 => 1,
        'icon-glass'                  => 1,
        'icon-globe'                  => 1,
        'icon-google-plus'            => 1,
        'icon-google-plus-sign'       => 1,
        'icon-group'                  => 1,
        'icon-h-sign'                 => 1,
        'icon-hand-down'              => 1,
        'icon-hand-left'              => 1,
        'icon-hand-right'             => 1,
        'icon-hand-up'                => 1,
        'icon-hdd'                    => 1,
        'icon-headphones'             => 1,
        'icon-heart'                  => 1,
        'icon-heart-empty'            => 1,
        'icon-home'                   => 1,
        'icon-hospital'               => 1,
        'icon-html5'                  => 1,
        'icon-inbox'                  => 1,
        'icon-indent-left'            => 1,
        'icon-indent-right'           => 1,
        'icon-info'                   => 1,
        'icon-info-sign'              => 1,
        'icon-inr'                    => 1,
        'icon-instagram'              => 1,
        'icon-italic'                 => 1,
        'icon-jpy'                    => 1,
        'icon-key'                    => 1,
        'icon-keyboard'               => 1,
        'icon-krw'                    => 1,
        'icon-laptop'                 => 1,
        'icon-leaf'                   => 1,
        'icon-legal'                  => 1,
        'icon-lemon'                  => 1,
        'icon-level-down'             => 1,
        'icon-level-up'               => 1,
        'icon-lightbulb'              => 1,
        'icon-link'                   => 1,
        'icon-linkedin'               => 1,
        'icon-linkedin-sign'          => 1,
        'icon-linux'                  => 1,
        'icon-list'                   => 1,
        'icon-list-alt'               => 1,
        'icon-list-ol'                => 1,
        'icon-list-ul'                => 1,
        'icon-location-arrow'         => 1,
        'icon-lock'                   => 1,
        'icon-long-arrow-down'        => 1,
        'icon-long-arrow-left'        => 1,
        'icon-long-arrow-right'       => 1,
        'icon-long-arrow-up'          => 1,
        'icon-magic'                  => 1,
        'icon-magnet'                 => 1,
        'icon-mail-forward'           => 1,
        'icon-mail-reply'             => 1,
        'icon-mail-reply-all'         => 1,
        'icon-male'                   => 1,
        'icon-map-marker'             => 1,
        'icon-maxcdn'                 => 1,
        'icon-medkit'                 => 1,
        'icon-meh'                    => 1,
        'icon-microphone'             => 1,
        'icon-microphone-off'         => 1,
        'icon-minus'                  => 1,
        'icon-minus-sign'             => 1,
        'icon-minus-sign-alt'         => 1,
        'icon-mobile-phone'           => 1,
        'icon-money'                  => 1,
        'icon-moon'                   => 1,
        'icon-move'                   => 1,
        'icon-music'                  => 1,
        'icon-off'                    => 1,
        'icon-ok'                     => 1,
        'icon-ok-circle'              => 1,
        'icon-ok-sign'                => 1,
        'icon-paper-clip'             => 1,
        'icon-paperclip'              => 1,
        'icon-paste'                  => 1,
        'icon-pause'                  => 1,
        'icon-pencil'                 => 1,
        'icon-phone'                  => 1,
        'icon-phone-sign'             => 1,
        'icon-picture'                => 1,
        'icon-pinterest'              => 1,
        'icon-pinterest-sign'         => 1,
        'icon-plane'                  => 1,
        'icon-play'                   => 1,
        'icon-play-circle'            => 1,
        'icon-play-sign'              => 1,
        'icon-plus'                   => 1,
        'icon-plus-sign'              => 1,
        'icon-plus-sign-alt'          => 1,
        'icon-power-off'              => 1,
        'icon-print'                  => 1,
        'icon-pushpin'                => 1,
        'icon-puzzle-piece'           => 1,
        'icon-qrcode'                 => 1,
        'icon-question'               => 1,
        'icon-question-sign'          => 1,
        'icon-quote-left'             => 1,
        'icon-quote-right'            => 1,
        'icon-random'                 => 1,
        'icon-refresh'                => 1,
        'icon-remove'                 => 1,
        'icon-remove-circle'          => 1,
        'icon-remove-sign'            => 1,
        'icon-renminbi'               => 1,
        'icon-renren'                 => 1,
        'icon-reorder'                => 1,
        'icon-repeat'                 => 1,
        'icon-reply'                  => 1,
        'icon-reply-all'              => 1,
        'icon-resize-full'            => 1,
        'icon-resize-horizontal'      => 1,
        'icon-resize-small'           => 1,
        'icon-resize-vertical'        => 1,
        'icon-retweet'                => 1,
        'icon-road'                   => 1,
        'icon-rocket'                 => 1,
        'icon-rotate-left'            => 1,
        'icon-rotate-right'           => 1,
        'icon-rss'                    => 1,
        'icon-rss-sign'               => 1,
        'icon-rupee'                  => 1,
        'icon-save'                   => 1,
        'icon-screenshot'             => 1,
        'icon-search'                 => 1,
        'icon-share'                  => 1,
        'icon-share-alt'              => 1,
        'icon-share-sign'             => 1,
        'icon-shield'                 => 1,
        'icon-shopping-cart'          => 1,
        'icon-sign-blank'             => 1,
        'icon-signal'                 => 1,
        'icon-signin'                 => 1,
        'icon-signout'                => 1,
        'icon-sitemap'                => 1,
        'icon-skype'                  => 1,
        'icon-smile'                  => 1,
        'icon-sort'                   => 1,
        'icon-sort-by-alphabet'       => 1,
        'icon-sort-by-alphabet-alt'   => 1,
        'icon-sort-by-attributes'     => 1,
        'icon-sort-by-attributes-alt' => 1,
        'icon-sort-by-order'          => 1,
        'icon-sort-by-order-alt'      => 1,
        'icon-sort-down'              => 1,
        'icon-sort-up'                => 1,
        'icon-spinner'                => 1,
        'icon-stackexchange'          => 1,
        'icon-star'                   => 1,
        'icon-star-empty'             => 1,
        'icon-star-half'              => 1,
        'icon-star-half-empty'        => 1,
        'icon-star-half-full'         => 1,
        'icon-step-backward'          => 1,
        'icon-step-forward'           => 1,
        'icon-stethoscope'            => 1,
        'icon-stop'                   => 1,
        'icon-strikethrough'          => 1,
        'icon-subscript'              => 1,
        'icon-suitcase'               => 1,
        'icon-sun'                    => 1,
        'icon-superscript'            => 1,
        'icon-table'                  => 1,
        'icon-tablet'                 => 1,
        'icon-tag'                    => 1,
        'icon-tags'                   => 1,
        'icon-tasks'                  => 1,
        'icon-terminal'               => 1,
        'icon-text-height'            => 1,
        'icon-text-width'             => 1,
        'icon-th'                     => 1,
        'icon-th-large'               => 1,
        'icon-th-list'                => 1,
        'icon-thumbs-down'            => 1,
        'icon-thumbs-down-alt'        => 1,
        'icon-thumbs-up'              => 1,
        'icon-thumbs-up-alt'          => 1,
        'icon-ticket'                 => 1,
        'icon-time'                   => 1,
        'icon-tint'                   => 1,
        'icon-trash'                  => 1,
        'icon-trello'                 => 1,
        'icon-trophy'                 => 1,
        'icon-truck'                  => 1,
        'icon-tumblr'                 => 1,
        'icon-tumblr-sign'            => 1,
        'icon-twitter'                => 1,
        'icon-twitter-sign'           => 1,
        'icon-umbrella'               => 1,
        'icon-unchecked'              => 1,
        'icon-underline'              => 1,
        'icon-undo'                   => 1,
        'icon-unlink'                 => 1,
        'icon-unlock'                 => 1,
        'icon-unlock-alt'             => 1,
        'icon-upload'                 => 1,
        'icon-upload-alt'             => 1,
        'icon-usd'                    => 1,
        'icon-user'                   => 1,
        'icon-user-md'                => 1,
        'icon-vk'                     => 1,
        'icon-volume-down'            => 1,
        'icon-volume-off'             => 1,
        'icon-volume-up'              => 1,
        'icon-warning-sign'           => 1,
        'icon-weibo'                  => 1,
        'icon-windows'                => 1,
        'icon-won'                    => 1,
        'icon-wrench'                 => 1,
        'icon-xing'                   => 1,
        'icon-xing-sign'              => 1,
        'icon-yen'                    => 1,
        'icon-youtube'                => 1,
        'icon-youtube-play'           => 1,
        'icon-youtube-sign'           => 1,
        'icon-zoom-in'                => 1,
        'icon-zoom-out'               => 1,
    );

    my $Counter;
    my $ErrorMessage;

    LINE:
    for my $Line ( split /\n/, $Code ) {
        $Counter++;

        # now check for icon-* classes
        if (
            $Line =~ m{class=".*?icon-(.+?)"}msxi                      # TT
            || $Line =~ m{<Item[ ]Key="Icon">icon-(.+?)</Item>}msxi    # XML Configuration
            )
        {
            if ( $Icons{ 'icon-' . $1 } ) {
                $ErrorMessage
                    .= "Replace font awesome icon class: 'icon-$1', try with: 'fa fa-$1' on line $Counter\n";
            }
        }

        # CSS
        elsif ( $Line =~ m{\.icon-(.+?) [ ] .* \{}msxi ) {
            if ( $Icons{ 'icon-' . $1 } ) {
                $ErrorMessage
                    .= "Replace font awesome icon class: 'icon-$1', try with: 'fa-$1' on line $Counter\n";
            }
        }
    }

    if ($ErrorMessage) {
        die __PACKAGE__ . "\n$ErrorMessage";
    }
}

1;
