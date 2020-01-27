from django.db import connection


def create_view(**kwargs):
    print('sqlquery')
    with connection.cursor() as cursor:
        cursor.execute("DROP VIEW IF EXISTS client_verifiedrequests")
        cursor.execute("""
            CREATE VIEW client_verifiedrequests AS
                SELECT r.id,
                    r.request_title,
                    r.request_text,
                    r.credit_amount,
                    r.send_date,
                    r.is_verified,
                    r.is_accepted,
                    r.request_type,
                    r.client_data_id,
                    r.credit_account_number_id,
                    r.worker_data_id
                FROM client_request r
                WHERE r.is_verified=1
                GROUP BY r.send_date
            """)
        return
