package com.hegens.core.parse.sql;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.antlr.runtime.tree.CommonTree;
import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenSource;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.TokenStreamRewriter;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.ParseTree;


public class ASTTest {
	public static void main(String[] args) throws FileNotFoundException, IOException {
		GQLLexer gqlLexer = new GQLLexer(new ANTLRFileStream("E:\\git\\hegens_v0.0.1\\hegens\\lib\\sql.1"));
		 CommonTokenStream tokens = new CommonTokenStream(gqlLexer);
//		 * T parser = new T(tokens);
//		 * TokenStreamRewriter rewriter = new TokenStreamRewriter(tokens);
//		 * parser.startRule();
	
//		 TokenStreamRewriter rewriter = new TokenStreamRewriter(tokens);
		
		GQLParser gqpParse= new GQLParser(tokens);
		
		
		
	//	GQLParser.Select_statementContext r = gqpParse.select_statement();
		
		ParseTree tree = gqpParse.parse(); // begin parsing at init rule
		
		
		System.out.println(tree.getText());		
		
		
		
		  //System.out.println(tree.get);
	}
}
