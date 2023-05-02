CREATE TABLE "public.Users" (
	"user_id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Group" (
	"group_id" serial NOT NULL,
	"user_id" serial NOT NULL,
	"group_admin" TEXT NOT NULL,
	"group_name" varchar(255) NOT NULL,
	"is_public" BOOLEAN NOT NULL,
	CONSTRAINT "Group_pk" PRIMARY KEY ("group_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Following" (
	"following_list" serial NOT NULL,
	"user_id" serial NOT NULL,
	"recipe_id" serial NOT NULL,
	CONSTRAINT "Following_pk" PRIMARY KEY ("following_list")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Messages" (
	"messager_id" serial NOT NULL,
	"sender" serial NOT NULL,
	"Recipient" serial NOT NULL,
	"body" TEXT NOT NULL,
	CONSTRAINT "Messages_pk" PRIMARY KEY ("messager_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Comments" (
	"comments_id" serial NOT NULL,
	"user-id" serial NOT NULL,
	"body" TEXT NOT NULL,
	"recipe_id" TEXT NOT NULL,
	CONSTRAINT "Comments_pk" PRIMARY KEY ("comments_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Grocery List" (
	"grocery_id" serial NOT NULL,
	"Ingredients" serial NOT NULL,
	"Instructions" serial NOT NULL,
	"is_private" BOOLEAN NOT NULL,
	CONSTRAINT "Grocery List_pk" PRIMARY KEY ("grocery_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Recipe" (
	"recipe_id" serial NOT NULL,
	"user_id" serial NOT NULL,
	"Ingredients" TEXT NOT NULL,
	"Instructions" TEXT NOT NULL,
	"is_public" BOOLEAN NOT NULL,
	CONSTRAINT "Recipe_pk" PRIMARY KEY ("recipe_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Occasion" (
	"occasion" serial NOT NULL,
	"Recipe_id" serial NOT NULL,
	"user_id" serial NOT NULL,
	"type" varchar(255) NOT NULL,
	CONSTRAINT "Occasion_pk" PRIMARY KEY ("occasion")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Group_users" (
	"group_user" serial NOT NULL,
	"group_id" serial NOT NULL,
	"user_id" serial NOT NULL,
	CONSTRAINT "Group_users_pk" PRIMARY KEY ("group_user")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Group" ADD CONSTRAINT "Group_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "Following" ADD CONSTRAINT "Following_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "Following" ADD CONSTRAINT "Following_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipe"("recipe_id");

ALTER TABLE "Messages" ADD CONSTRAINT "Messages_fk0" FOREIGN KEY ("sender") REFERENCES "Users"("user_id");
ALTER TABLE "Messages" ADD CONSTRAINT "Messages_fk1" FOREIGN KEY ("Recipient") REFERENCES "Users"("user_id");

ALTER TABLE "Comments" ADD CONSTRAINT "Comments_fk0" FOREIGN KEY ("user-id") REFERENCES "Users"("user_id");
ALTER TABLE "Comments" ADD CONSTRAINT "Comments_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipe"("recipe_id");

ALTER TABLE "Grocery List" ADD CONSTRAINT "Grocery List_fk0" FOREIGN KEY ("Ingredients") REFERENCES "Recipe"("Ingredients");
ALTER TABLE "Grocery List" ADD CONSTRAINT "Grocery List_fk1" FOREIGN KEY ("Instructions") REFERENCES "Recipe"("Instructions");

ALTER TABLE "Recipe" ADD CONSTRAINT "Recipe_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "Occasion" ADD CONSTRAINT "Occasion_fk0" FOREIGN KEY ("Recipe_id") REFERENCES "Recipe"("recipe_id");
ALTER TABLE "Occasion" ADD CONSTRAINT "Occasion_fk1" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "Group_users" ADD CONSTRAINT "Group_users_fk0" FOREIGN KEY ("group_id") REFERENCES "Group"("group_id");
ALTER TABLE "Group_users" ADD CONSTRAINT "Group_users_fk1" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");









