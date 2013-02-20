main: update
	@echo "============================================"
	@echo "Welcome to Poker!!!"
	@echo "          work by xiaomo(wxm4ever@gmail.com)"
	@echo "============================================"


.PHONY:power less update

power:
	chmod a+w cache templates_c upload

less:
	lessc --yui-compress static/less/main.less static/css/main.css

coffee:
	coffee --compile -o static/js static/coffee

update: less coffee
	@echo "Updateing Static Files"
