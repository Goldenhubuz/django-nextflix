up:
	docker-compose up --build -d
copy-env:
	cp .env.example .env
	cp .db.env.example .db.env
migrate:
	python3 manage.py migrate
run:
	python3 manage.py runserver
i:
	pip install -r requirements.txt
cru:
	python manage.py createsuperuser
migration:
	python3 manage.py makemigrations
mig:
	make migration & make migrate
clear-mig:
	find . -path "*/migrations/*.py" -not -name "__init__.py" -delete && find . -path "*/migrations/*.pyc"  -delete
no-db:
	rm -rf db.sqlite3
re-django:
	pip3 uninstall Django -y && pip3 install Django
startapp:
	python3 manage.py startapp $(name)
re-migrate:
	make backup && make no-db && make clear-mig && make re-django
backup:
	cp db.sqlite3 backups/db.sqlite3_$(date +"%d-%b-%Y_%H-%M")
clear-backups:
	rm -rf backups/*
