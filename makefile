include config.mk

CC = gcc
CFLAGS = -Wall -g
TARGET = my_program


SRC_DIR = src
OBJ_DIR = obj
OBJS = $(OBJ_DIR)/main.o $(OBJ_DIR)/utils.o




all: check_key $(TARGET)


check_key:
	ifeq ($(DEB_INSTALLED), 1)
    	INFO := "Le paquet .deb est installé. Compilation possible."
	else
    	INFO := "Le paquet .deb n'est pas installé. Lancez ./configure."
	endif


$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@


clean:
	rm -f $(OBJ_DIR)/*.o $(TARGET)
	rm -rf $(OBJ_DIR)
	rm -f config.mk
