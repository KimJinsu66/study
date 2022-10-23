# frozen_string_literal: true

require './menu'
require './menu_item'

all_menu = Menu.new('Jinsu Menu', '전체 메뉴')
launch_menu = Menu.new('Launch Menu', '점심 메뉴')
dinner_menu = Menu.new('Dinner Menu', '저녁 메뉴')
desert_menu = Menu.new('desert Menu', '디저트 메뉴')

all_menu.add(launch_menu)
all_menu.add(dinner_menu)
all_menu.add(desert_menu)

launch_menu.add(MenuItem.new('떡볶이', 1000, '떡볶이'))
launch_menu.add(MenuItem.new('로제 떡볶이', 1000, ' 크림 + 고추장'))
launch_menu.add(MenuItem.new('차돌 떡볶이', 1000, ' 차돌 + 떡볶이'))

dinner_menu.add(MenuItem.new('삽겹살', 1200, '200g'))
dinner_menu.add(MenuItem.new('김치찌개', 1000, ' 1인분'))
dinner_menu.add(MenuItem.new('된장찌개', 800, ' 1인분'))

desert_menu.add(MenuItem.new('몽블랑', 600, ' X'))
desert_menu.add(MenuItem.new('치즈 케이크', 600, ' X'))

all_menu.print
