package presto

import (
	"encoding/json"
	"fmt"
)

type QueryError struct {
	Message   string `json:"message"`
	ErrorCode int    `json:"errorCode"`
	ErrorName string `json:"errorName"`
	ErrorType string `json:"errorType"`
	// TODO: update this after https://github.com/prestodb/presto/pull/21588 is merged.
	Retriable     bool           `json:"boolean"`
	ErrorLocation *ErrorLocation `json:"errorLocation,omitempty"`
	FailureInfo   *FailureInfo   `json:"failureInfo,omitempty"`
}

func (q *QueryError) String() string {
	if q == nil {
		return "nil QueryError"
	}
	byt, _ := json.MarshalIndent(q, "", "    ")
	return string(byt)
}

func (q *QueryError) Error() string {
	return q.String()
}

type ErrorLocation struct {
	LineNumber   int `json:"lineNumber"`
	ColumnNumber int `json:"columnNumber"`
}

func (e *ErrorLocation) String() string {
	return fmt.Sprintf("line %d:%d", e.LineNumber, e.ColumnNumber)
}

type FailureInfo struct {
	Type          string         `json:"type"`
	Message       string         `json:"message,omitempty"`
	Cause         *FailureInfo   `json:"cause,omitempty"`
	Suppressed    []FailureInfo  `json:"suppressed"`
	Stack         []string       `json:"stack"`
	ErrorLocation *ErrorLocation `json:"errorLocation,omitempty"`
}
