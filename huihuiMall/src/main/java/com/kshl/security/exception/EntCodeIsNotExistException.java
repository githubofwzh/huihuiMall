package com.kshl.security.exception;

import org.springframework.security.core.AuthenticationException;

/**
 * Created by Administrator on 2017/6/27.
 */
public class EntCodeIsNotExistException extends AuthenticationException {
    public EntCodeIsNotExistException(String msg, Throwable t) {
        super(msg, t);
    }

    public EntCodeIsNotExistException(String msg) {
        super(msg);
    }
}
