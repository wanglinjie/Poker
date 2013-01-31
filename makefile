main:
	@echo "============================================"
	@echo "Welcome to Poker!!!"
	@echo "          work by xiaomo(wxm4ever@gmail.com)"
	@echo "============================================"


.PHONY:power less update

power:
	chmod a+w cache templates_c

less:
	lessc --yui-compress static/less/main.less static/css/main.css

update: less
	@echo "Updateing Static Files"
