# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nfarfetc <nfarfetc@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/07 19:12:18 by nfarfetc          #+#    #+#              #
#    Updated: 2021/10/13 16:33:40 by nfarfetc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libft.a

SRCS		=	ft_atoi.c 		ft_bzero.c 		ft_calloc.c 	ft_isalnum.c 	ft_isalpha.c 	ft_isascii.c 	ft_isdigit.c 	ft_isprint.c\
				ft_itoa.c 		ft_memchr.c 	ft_memcmp.c 	ft_memcpy.c 	ft_memmove.c 	ft_memset.c 	ft_putchar_fd.c\
				ft_putendl_fd.c ft_putnbr_fd.c 	ft_putstr_fd.c 	ft_split.c 		ft_strchr.c 	ft_strdup.c 	ft_striteri.c\
				ft_strjoin.c 	ft_strlcat.c 	ft_strlcpy.c 	ft_strlen.c 	ft_strmapi.c 	ft_strncmp.c 	ft_strnstr.c\
				ft_strrchr.c 	ft_strtrim.c 	ft_substr.c 	ft_tolower.c 	ft_toupper.c

SRCS_B		=	ft_lstadd_back_bonus.c 	ft_lstadd_front_bonus.c 	ft_lstclear_bonus.c 	ft_lstdelone_bonus.c 	ft_lstiter_bonus.c\
				ft_lstlast_bonus.c 		ft_lstnew_bonus.c 			ft_lstsize_bonus.c 		ft_lstmap_bonus.c

HEADER		=	libft.h
OBJS		=	$(patsubst %.c,%.o,$(SRCS))
OBJS_B		=	$(SRCS_B:%.c=%.o)

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror -I$(HEADER)

.PHONY		:	all clean fclean re bonus

all			:	$(NAME)

$(NAME)		:	$(OBJS) $(HEADER)
	@ar rcs $(NAME) $?

%.o : %.c $(HEADER)
	@$(CC) $(CFLAGS) -c $< -o $@

bonus		:
	@make OBJS="$(OBJS_B)" all

clean		:	
	@rm -f $(OBJS) $(OBJS_B)

fclean		:	clean
	@rm -f $(NAME)

re:			fclean all
