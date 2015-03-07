# --- !Ups

create or replace function update_timestamp() returns trigger as $$
begin
   NEW.updated_at = now();;
   return NEW;;
end;;
$$ language 'plpgsql';

create trigger contests_timestamp_update before update on contests for each row execute procedure update_timestamp();

create trigger problems_timestamp_update before update on problems for each row execute procedure update_timestamp();

create trigger users_timestamp_update before update on users for each row execute procedure update_timestamp();

create trigger access_tokens_timestamp_update before update on access_tokens for each row execute procedure update_timestamp();

create trigger auth_codes_timestamp_update before update on auth_codes for each row execute procedure update_timestamp();

create trigger clients_timestamp_update before update on clients for each row execute procedure update_timestamp();

create trigger confirmation_tokens_timestamp_update before update on confirmation_tokens for each row execute procedure update_timestamp();


# --- !Downs

drop function update_timestamp() cascade;
drop trigger contests_timestamp_update on contests;
drop trigger problems_timestamp_update on problems;
drop trigger users_timestamp_update on users;
drop trigger access_tokens_timestamp_update on access_tokens;
drop trigger auth_codes_timestamp_update on auth_codes;
drop trigger clients_timestamp_update on clients;
drop trigger confirmation_tokens_timestamp_update on confirmation_tokens;
