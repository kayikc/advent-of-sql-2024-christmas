WITH allowed_chars AS (
  SELECT id, value 
  FROM (
    SELECT id, value FROM letters_a
    UNION ALL 
    SELECT id, value FROM letters_b
  ) combined
  WHERE value BETWEEN 65 AND 90  -- UPPERCASE
     OR value BETWEEN 97 AND 122 -- lowercase 
     OR value IN (32,33,34,39,40,41,44,45,46,58,59,63) -- allowed special characters
)
SELECT string_agg(chr(value), '' ORDER BY id) AS decoded_message
FROM allowed_chars;