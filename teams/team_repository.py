from sqlalchemy.sql import text

def save(label, engine):
    sql = """
INSERT INTO teams
VALUES (
  :id,
  :name
)
ON DUPLICATE KEY UPDATE
      name=VALUES(name)
"""

    engine.execute(text(sql),
                   id=label['id'],
                   name=label['name']
                  )
