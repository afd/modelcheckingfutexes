static perm_t* elementset_1[1];

static void initialiseGroup() {

   elementset_1[0] = malloc(2 * sizeof(perm_t));
   elementset_1[0][0] = constructPerm("");
   elementset_1[0][1] = constructPerm("1 2");
}
