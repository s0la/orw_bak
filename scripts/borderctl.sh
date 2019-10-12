#!/bin/bash

orw_conf=~/.config/orw/config
dunst_conf=~/.orw/dotfiles/.config/dunst/dunstrc
theme_conf=~/.orw/themes/theme/openbox-3/themerc
openbox_conf=~/.orw/dotfiles/.config/openbox/rc.xml
lock_conf=~/.orw/dotfiles/.config/i3lockrc
rofi_path=~/.orw/dotfiles/.config/rofi
rofi_list_conf=list

while getopts :c: flag; do
	case $flag in
		c)
			rofi_mode=$OPTARG.rasi
			shift 2;;
	esac
done

if [[ $2 =~ [0-9]+ ]]; then
	sign=${2%%[0-9]*}
	new_value=${2#$sign}
fi

case $1 in
	r*)
		if [[ $1 == rip ]]; then
			if [[ $3 ]]; then
				second_sign=${3%%[0-9]*}
				second_arg=${3#$second_sign}
			fi

			awk -i inplace '/inputbar|element/ { set = 1 } {
				if(/padding/ && set) {
					set = 0

					if(!av) {
						fv = '$new_value'
						sv = '${second_arg-0}'
						av = gensub(".*([0-9]+).*([0-9]+).*", "\\1 \\2", 1)
						split(av, v)

						v1 = ("'$sign'") ? v[1] '$sign' fv : fv 
						v2 = (sv) ? ("'$second_sign'") ? v[2] '$second_sign' sv : sv : v1
					}

					$0 = gensub("([^0-9]*)[0-9]+(.* )[0-9]+(.*)", "\\1" v1 "\\2" v2 "\\3", 1)
				}
				print
			}' $rofi_path/${rofi_mode-list.rasi}
		else
			case $1 in
				rw) pattern=width;;
				rim)
					px=px
					pattern=margin
					[[ $rofi_mode =~ dmenu ]] && pattern+=".* 0 .*";;
				rwp)
					px=px
				 	pattern=padding;;
				rbw)
					px=px
					pattern=border
					rofi_conf=theme.rasi;;
				rln)
					pattern=lines
					rofi_conf=config.rasi;;
			esac

			awk -i inplace '\
				{ if(/'"$pattern"'/ && ! set) {
					px = "'$px'"
					nv = '$new_value'
					cv = gensub(".* ([0-9]*)" px ".*", "\\1", 1)
					sub(cv px, ("'$sign'") ? cv '$sign' nv px : nv px)
					set = 1
				}
				print
			}' $rofi_path/${rofi_conf:-${rofi_mode-list.rasi}}
		fi;;
	tp)
		awk -i inplace '\
			{
				if(/padding/) {
					nv = '$new_value'
					cv = gensub("[^0-9]*([0-9]+).*", "\\1", 1)
					sub(cv, ("'$sign'") ? cv '$sign' nv : nv)
				}
				print
		}' ~/.orw/dotfiles/.config/gtk-3.0/gtk.css;;
	tb*)
		ob_reload=true
		[[ $1 == tb ]] && pattern='name.*\*' nr=1 || pattern='font.*ActiveWindow' nr=2

		awk -i inplace '\
			/'$pattern'/ { nr = NR } { \
			if (nr && NR == nr + '$nr') {
				nv = "'${new_value:-$2}'"
				cv = gensub(".*>(.*)<.*", "\\1", 1)
				sub(cv, ('$nr' == 1) ? (nv) ? nv : (cv == "no") ? "yes" : "no" : ("'$sign'") ? cv '$sign' nv : nv)
			}
			print
		}' $openbox_conf;;
	d*)
		[[ $1 == dp ]] && pattern=padding || pattern=frame_width

		awk -i inplace '{ \
			if(/^\s*'$pattern'/) {
				nv = '$new_value'
				$NF = ("'$sign'") ? $NF '$sign' nv : nv
			}
			print
		}' $dunst_conf

		killall dunst
		dunst &;;
	l*)
		[[ $1 == lrw ]] && pattern=width || pattern=radius

		awk -i inplace '{ \
			if(/^'${1: -1}'\w{3,5}/) {
				nv = '$new_value'
				cv = gensub(".*=", "", 1)
				sub(cv, ("'$sign'") ? cv '$sign' nv : nv)
			}
			print
		}' $lock_conf;;
	*)
		ob_reload=true

		case $1 in
			hw) pattern=handle.width;;
			bw) pattern=^border.width;;
			cw) pattern=client.*.width;;
			jt) pattern=label.*justify;;
			pw) pattern=^padding.width;;
			ph) pattern=^padding.height;;
			mbw)
				pattern=^menu.border.width
				gtkrc2=~/.orw/themes/theme/gtk-2.0/gtkrc;;
		esac

		awk -i inplace '{ \
			if(/'$pattern'/) {
				nv = '${new_value:-\"$2\"}'
				$NF = ("'$sign'") ? $NF '$sign' nv : nv
				nv = $NF
			}
			if("'$pattern'" ~ "menu" && /^menu.overlap/) {
				$NF = -(nv + 3)
			}
			if("'$pattern'" ~ "menu") { 
				if(/^style "menu"/) set = 2
				
				if(/thickness/ && set) {
					$NF = nv
					set--
				}
			}
			print
		}' $theme_conf $gtkrc2
esac

[[ $ob_reload ]] && openbox --reconfigure || exit 0
