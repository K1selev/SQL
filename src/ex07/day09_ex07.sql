CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[]) RETURNS NUMERIC AS
$$
DECLARE
    x NUMERIC := arr[1];
BEGIN
    FOR counter IN 2..array_upper(arr, 1)
    LOOP
        IF arr[counter] < x THEN x = arr[counter];
        END IF;
    end loop;
    return x;
END;
$$ LANGUAGE plpgsql;